Pod::Spec.new do |s|  
    s.name              = 'Dapi'
    s.version           = '1.0.0-beta'
    s.summary           = 'Financial APIs to connect users bank accounts.'
    s.homepage          = 'https://dapi.com'
    s.author            = { 'Dapi' => 'dev@dapi.com' }
    s.license           = { :type => 'Commercial', :file => 'LICENSE.md' }
    s.platform          = "ios", '13.0'
    s.source		= { :http => 'https://github.com/dapi-co/Dapi-iOS/releases/download/1.0.0-beta/DapiSDK.zip'}
    s.vendored_frameworks = 'DapiSDK.xcframework'
    s.cocoapods_version = '>= 1.10.0'
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.info_plist = { 'SDKVersion' => s.version.to_s}

    
end  
