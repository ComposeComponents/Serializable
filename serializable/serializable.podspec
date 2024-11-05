Pod::Spec.new do |spec|
    spec.name                     = 'serializable'
    spec.version                  = '0.0.1'
    spec.homepage                 = ''
    spec.source                   = { :http=> ''}
    spec.authors                  = ''
    spec.license                  = ''
    spec.summary                  = 'Use `Serialize` in your Kotlin Multiplatform Projects'
    spec.vendored_frameworks      = 'build/cocoapods/framework/serializable.framework'
    spec.libraries                = 'c++'
    spec.ios.deployment_target    = '16.0'
                
                
    if !Dir.exist?('build/cocoapods/framework/serializable.framework') || Dir.empty?('build/cocoapods/framework/serializable.framework')
        raise "

        Kotlin framework 'serializable' doesn't exist yet, so a proper Xcode project can't be generated.
        'pod install' should be executed after running ':generateDummyFramework' Gradle task:

            ./gradlew :serializable:generateDummyFramework

        Alternatively, proper pod installation is performed during Gradle sync in the IDE (if Podfile location is set)"
    end
                
    spec.xcconfig = {
        'ENABLE_USER_SCRIPT_SANDBOXING' => 'NO',
    }
                
    spec.pod_target_xcconfig = {
        'KOTLIN_PROJECT_PATH' => ':serializable',
        'PRODUCT_MODULE_NAME' => 'serializable',
    }
                
    spec.script_phases = [
        {
            :name => 'Build serializable',
            :execution_position => :before_compile,
            :shell_path => '/bin/sh',
            :script => <<-SCRIPT
                if [ "YES" = "$OVERRIDE_KOTLIN_BUILD_IDE_SUPPORTED" ]; then
                  echo "Skipping Gradle build task invocation due to OVERRIDE_KOTLIN_BUILD_IDE_SUPPORTED environment variable set to \"YES\""
                  exit 0
                fi
                set -ev
                REPO_ROOT="$PODS_TARGET_SRCROOT"
                "$REPO_ROOT/../gradlew" -p "$REPO_ROOT" $KOTLIN_PROJECT_PATH:syncFramework \
                    -Pkotlin.native.cocoapods.platform=$PLATFORM_NAME \
                    -Pkotlin.native.cocoapods.archs="$ARCHS" \
                    -Pkotlin.native.cocoapods.configuration="$CONFIGURATION"
            SCRIPT
        }
    ]
                
end