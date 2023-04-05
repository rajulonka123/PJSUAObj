#
# Be sure to run `pod lib lint PJSUA_pod.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PJSUA_pod'
  s.version          = '0.1.0'
  s.summary          = 'A short description of PJSUA_pod.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/Raju Lonka/PJSUA_pod'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Raju Lonka' => 'raju@linkedphone.com' }
  s.source           = { :git => 'https://github.com/Raju Lonka/PJSUA_pod.git', :tag => s.version.to_s }
  s.ios.deployment_target = '10.0'
  s.source_files = 'PJSUA_pod/Classes/**/*'
 
end
