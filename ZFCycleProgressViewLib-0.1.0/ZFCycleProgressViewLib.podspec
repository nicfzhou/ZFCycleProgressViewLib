Pod::Spec.new do |s|
  s.name = 'ZFCycleProgressViewLib'
  s.version = '0.1.0'
  s.summary = '生成自定义的圆形进度圈'
  s.license = 'MIT'
  s.authors = {"nicfzhou"=>"nicfzhou@gmail.com"}
  s.homepage = 'https://github.com/nicfzhou/ZFCycleProgressViewLib'
  s.description = '生成自定义的圆形进度圈'
  s.frameworks = ["UIKit", "QuartzCore"]
  s.requires_arc = true
  s.source = {}

  s.platform = :ios, '6.0'
  s.ios.platform             = :ios, '6.0'
  s.ios.preserve_paths       = 'ios/ZFCycleProgressViewLib.framework'
  s.ios.public_header_files  = 'ios/ZFCycleProgressViewLib.framework/Versions/A/Headers/*.h'
  s.ios.resource             = 'ios/ZFCycleProgressViewLib.framework/Versions/A/Resources/**/*'
  s.ios.vendored_frameworks  = 'ios/ZFCycleProgressViewLib.framework'
end
