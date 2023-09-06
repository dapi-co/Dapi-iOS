Pod::Spec.new do |s|  
    s.name              = 'DapiBanking'
    s.version           = '2.12.2'
    s.summary           = 'Financial APIs to connect users bank accounts.'
    s.homepage          = 'https://dapi.com'
    s.author            = { 'Dapi' => 'dev@dapi.com' }
    s.license           = { :type => 'MIT', :text => <<-LICENSE
Copyright (C) 2018 Dapi Permission is hereby granted to use this framework as is, modification are not allowed. All rights reserved.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
                 LICENSE
               }
    s.platform          = "ios", '13.0'
    s.source		= { :http => 'https://github.com/dapi-co/Dapi-iOS/releases/download/2.12.2/DapiSDK.zip'}
    s.vendored_frameworks = 'DapiSDK.xcframework'
    s.frameworks        = 'WebKit'
    s.cocoapods_version = '>= 1.10.0'
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.info_plist = { 'SDKVersion' => s.version.to_s}

    
end  
