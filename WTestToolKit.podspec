Pod::Spec.new do |s|
  s.name             = 'WTestToolKit'
  s.version          = '0.1.2'
  s.summary          = 'A short description of WTestToolKit.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/Jefferson Batista/WTestToolKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jefferson Batista' => 'jeffsouzabatista@gmail.com' }
  s.source           = { :git => 'git@github.com:Jeffersons/WTestToolKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'

  s.source_files = [
    'WTestToolKit/Classes/**/*',
    'WTestToolKit/Resources/Source/**/*.{h,m,swift}',
    'WTestToolKit/Resources/Extensions/**/*.{h,m,swift}'
  ]
  s.resource_bundles = {
    'WTestToolKit' => ['WTestToolKit/**/*{xcassets,xib,lproj,json}']
  }
  s.resources = ['WTestToolKit/Resources/**/*.{xcassets,xib,lproj,json}']

  s.dependency 'SnapKit', '~> 5.0'
  s.dependency 'SwiftLint'
  s.dependency 'lottie-ios'
end
