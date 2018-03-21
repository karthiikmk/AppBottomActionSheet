

Pod::Spec.new do |s|
  s.name             = 'AppBottomActionSheet'
  s.version          = '0.1.0'
  s.summary          = 'A Sweet extension for custom bottom sheet'
  s.homepage         = 'https://github.com/karthikAdaptavant/AppBottomActionSheet'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'karthikAdaptavant' => 'karthik.samy@a-cti.com' }
  s.source           = { :git => 'https://github.com/karthikAdaptavant/AppBottomActionSheet.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/i_am_kaarthik'

  s.ios.deployment_target = '10.0'

  s.source_files = 'AppBottomActionSheet/Classes/**/*'
  
  # s.resource_bundles = {
  #   'AppBottomActionSheet' => ['AppBottomActionSheet/Assets/*.png']
  # }

end
