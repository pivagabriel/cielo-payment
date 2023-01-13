# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

source 'https://github.com/CocoaPods/Specs.git'

target 'payment' do
  pod 'Braspag3Ds'
  pod 'Alamofire'
end

platform :ios, '11.0'
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
      end
    end
  end
