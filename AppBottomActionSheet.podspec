

Pod::Spec.new do |s|
  s.name             = 'AppBottomActionSheet'
  s.version          = '1.0.11'
  s.swift_version    = '5.0'
  s.summary          = 'A Sweet extension for custom bottom sheet'
  s.homepage         = 'https://github.com/karthikAdaptavant/AppBottomActionSheet'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'karthikAdaptavant' => 'karthik.samy@a-cti.com' }
  s.source           = { :git => 'https://github.com/karthikAdaptavant/AppBottomActionSheet.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/i_am_kaarthik'

  s.ios.deployment_target = '10.0'
  s.source_files = 'Sources/AppBottomActionSheet/Classes/**/*.{swift}'
  
  s.resource_bundles = {
    'AppBottomActionSheet' => ['Sources/AppBottomActionSheet/Classes/**/*.{storyboard}']
  }

end


# To Make a new build, run fastlane. 
