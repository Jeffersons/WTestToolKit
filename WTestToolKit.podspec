Pod::Spec.new do |s|
  s.name             = 'WTestToolKit'
  s.version          = '0.1.0'
  s.summary          = 'A short description of WTestToolKit.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/Jefferson Batista/WTestToolKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jefferson Batista' => 'jeffsouzabatista@gmail.com' }
  s.source           = { :git => 'https://github.com/Jefferson Batista/WTestToolKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'

  s.source_files = [
    'WTestToolKit/Classes/**/*',
    'WTestToolKit/Resources/Source/**/*.{h,m,swift}',
    'WTestToolKit/Resources/Extensions/**/*.{h,m,swift}'
  ]

  s.dependency 'SnapKit', '~> 5.0'
  s.dependency 'SwiftLint'
  s.resources = 'WTestToolKit/Resources/**/*.{xcassets,xib,lproj,json}'
end
