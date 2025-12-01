
Pod::Spec.new do |s|
  s.name         = "SVGAPlayerKit"
  s.version      = "2.6.0"
  s.summary      = "SVGAPlayer 是一个高性能的动画播放器 (Fork 维护版)"
  s.description  = <<-DESC
                   SVGA 是一种全新的动画格式；
                   SVGA 让动画开发分工明确，大大减少动画交互的沟通成本，提升开发效率；
                   SVGA 可以在 iOS / Android / Web / Flutter 实现高性能的动画播放。
                   此版本为 fork 维护版本。
                   DESC

  s.homepage     = "https://github.com/ETsunny/SVGAPlayer-iOS"
  s.license      = "Apache 2.0"
  s.author       = { "Zahi" => "lzxetsunny@outlook.com" }
  s.platform     = :ios, "11.0"
  s.source       = { :git => "https://github.com/ETsunny/SVGAPlayer-iOS.git", :tag => s.version }
  s.subspec 'Core' do |ss|
    ss.source_files  = "Source/*.{h,m}"
    ss.requires_arc = true
    ss.dependency 'SSZipArchive', '>= 1.8.1'
    ss.library = "z"
    ss.framework = "AVFoundation"
    ss.dependency 'SVGAPlayerKit/ProtoFiles'
  end
  s.subspec 'ProtoFiles' do |ss|
    ss.source_files  = "Source/pbobjc/*.{h,m}"
    ss.requires_arc = false
    ss.dependency 'Protobuf', '~> 3.4'
    ss.pod_target_xcconfig = {
      'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS=1',
    }
  end  
end
