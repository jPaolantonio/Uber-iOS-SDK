Pod::Spec.new do |s|
  s.name             = "Uber-iOS-SDK"
  s.version          = "0.1.0"
  s.summary          = "A well-tested and well documented SDK for Uber on iOS."
  s.description      = <<-DESC
                        An iOS SDK for the Uber API with a few goals.

                        * Well-tested
                        * Well-documented
                        * Feature complete

                        Based of the endpoints listed https://developer.uber.com/v1/endpoints/
                       DESC
  s.homepage         = "https://github.com/jpaolantonio/Uber-iOS-SDK"
  s.license          = 'MIT'
  s.author           = { "James Paolantonio" => "jamesp@compass.com" }
  s.source           = { :git => "https://github.com/jpaolantonio/Uber-iOS-SDK.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/jpaolantonio'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.module_name = "UberSDK"
  s.header_dir = "UberSDK"

  s.source_files = 'Pod/Classes/**/*'

  s.public_header_files = 'Pod/Classes/**/*.h'

end
