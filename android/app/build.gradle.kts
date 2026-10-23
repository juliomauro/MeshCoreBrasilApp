import java.io.FileInputStream
import java.util.Properties

val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

val hasReleaseKeystore = listOf("keyAlias", "keyPassword", "storeFile", "storePassword")
    .all { !keystoreProperties.getProperty(it).isNullOrBlank() }

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "br.meshcorebrasil.app"
    // Pinned to 36 (not maxOf(flutter.compileSdkVersion, 37)): API 37 only
    // ships as decimal sub-versions (37.0/37.1/37.2) now, and AGP 8.x cannot
    // resolve the bare "android-37" target hash against them. Revisit once
    // the project is on AGP 9+ (currently blocked by flutter_libserialport's
    // legacy, AGP9-incompatible android/build.gradle).
    compileSdk = 36
    // NDK r28+ compiles 16 KB ELF-aligned .so files by default (Google Play requirement since Nov 2025)
    ndkVersion = "28.2.13676358"

    compileOptions {
        isCoreLibraryDesugaringEnabled = true
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    defaultConfig {
        applicationId = "br.meshcorebrasil.app"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName

        externalNativeBuild {
            cmake {
                arguments += "-DANDROID_SUPPORT_FLEXIBLE_PAGE_SIZES=ON"
            }
        }
    }

    signingConfigs {
        if (hasReleaseKeystore) {
            create("release") {
                keyAlias = keystoreProperties.getProperty("keyAlias")
                keyPassword = keystoreProperties.getProperty("keyPassword")
                storeFile = file(keystoreProperties.getProperty("storeFile"))
                storePassword = keystoreProperties.getProperty("storePassword")
            }
        }
    }

    buildTypes {
        release {
            // Falls back to the debug keystore when no release key.properties
            // exists yet, so `flutter build apk --release` still produces an
            // installable (just not Play-Store-ready) APK during early
            // testing. Replace with a real release keystore before publishing.
            signingConfig =
                if (hasReleaseKeystore) {
                    signingConfigs.getByName("release")
                } else {
                    signingConfigs.getByName("debug")
                }
            isMinifyEnabled = true
        }
    }

    // AGP 8.5.1+ with useLegacyPackaging=false produces uncompressed .so files
    // zip-aligned at 16 KB boundaries — required by Google Play for 16 KB page size support.
    packaging {
        jniLibs {
            useLegacyPackaging = false
            // flutter_libserialport .so files are not 16 KB page-aligned.
            // Serial ports are not used on Android (BLE is used instead), so we
            // exclude them to keep the APK compliant with Google Play requirements.
            excludes += setOf(
                "lib/arm64-v8a/libserialport.so",
                "lib/armeabi-v7a/libserialport.so",
                "lib/x86_64/libserialport.so",
                "lib/x86/libserialport.so"
            )
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
}

configurations.all {
    resolutionStrategy.eachDependency {
        // home_widget pulls in alpha Glance deps that require AGP 9+.
        // Pin them to stable releases compatible with AGP 8.x.
        if (requested.group == "androidx.glance") {
            useVersion("1.1.0")
            because("glance-appwidget 1.3.0-alpha01 requires AGP 9+; 1.1.0 is the latest stable")
        }
    }
}

