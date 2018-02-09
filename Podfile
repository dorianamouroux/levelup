source 'https://github.com/CocoaPods/Specs.git'

# ignore all warnings from all pods
inhibit_all_warnings!

# Disable sending stats
ENV['COCOAPODS_DISABLE_STATS'] = 'true'

platform :ios, '9.0'

use_frameworks!

def shared_pods
    pod 'Firebase/Core'
    pod 'Firebase/Firestore'
    pod 'Firebase/Auth'
    pod 'Kingfisher', '~> 4.x'
    pod 'NVActivityIndicatorView', '~> 4.x'
    pod 'R.swift', '~> 4.x'
    pod 'IQKeyboardManagerSwift'
    pod 'Firebase'
    pod 'GoogleSignIn'
end

target 'levelup' do
    shared_pods
end
