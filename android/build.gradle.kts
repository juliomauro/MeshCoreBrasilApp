allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// Force every subproject — including third-party plugin modules such as
// home_widget, which ship Kotlin inline bytecode built with a newer JVM
// target than Flutter's default toolchain — onto the same JVM target as
// the app module. Without this, Gradle fails with "Cannot inline bytecode
// built with JVM target X into bytecode that is being built with JVM
// target Y" whenever a plugin's precompiled stdlib target drifts ahead of
// the project-wide default.
subprojects {
    // afterEvaluate so this runs after the subproject's own build.gradle
    // (e.g. home_widget pins Java 1.8 inline in its android{} block) has
    // already set its defaults — otherwise those later-evaluated, more
    // specific settings would win over ours.
    afterEvaluate {
        tasks.withType<org.jetbrains.kotlin.gradle.tasks.KotlinCompile>().configureEach {
            compilerOptions {
                jvmTarget.set(org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17)
            }
        }
        tasks.withType<JavaCompile>().configureEach {
            sourceCompatibility = JavaVersion.VERSION_17.toString()
            targetCompatibility = JavaVersion.VERSION_17.toString()
        }
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
