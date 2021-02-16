Pod::Spec.new do |s|
  s.name             = 'NotificationSwift'
  s.version          = '0.1.1'
  s.summary          = 'NotificationSwift.'
  s.description      = 'NotificationSwift.'
  s.homepage         = 'https://github.com/IsaacDouglas/NotificationSwift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'IsaacDouglas' => 'isaacdouglas2015@gmail.com' }
  s.source           = { :git => 'https://github.com/IsaacDouglas/NotificationSwift.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.source_files = 'NotificationSwift/Classes/**/*'
end
