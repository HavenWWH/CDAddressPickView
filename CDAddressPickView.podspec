#
# Be sure to run `pod lib lint CDAddressPickView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CDAddressPickView'
  s.version          = '0.1.0'
  s.summary          = '省市区选择器'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
选择省, 市, 区
                       DESC

  s.homepage         = 'https://github.com/HavenWWH'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '513433750@qq.com' => '513433750@qq.com' }
  s.source           = { :git => 'https://gitlab.ttsing.com/ios/CDAddressPickView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files  = "CDAddressPickView/**/*.{h,m}"
  s.resources = 'CDAddressPickView/**/*.{png,xib,nib,bundle,json}'
  
  # s.resource_bundles = {
  #   'CDAddressPickView' => ['CDAddressPickView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
