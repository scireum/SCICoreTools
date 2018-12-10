Pod::Spec.new do |s|
s.name         = 'SCICoreTools'
s.version      = '0.1.0'
s.summary      = 'SCICoreTools'
s.description  = <<-DESC
Barcode scanner
DESC
s.homepage     = 'https://github.com/scireum/SCICoreTools'
s.license      = { :type => 'MIT' }
s.author       = { 'scireum' => 'info+dev@scireum.de'}
s.source       = { :git => 'https://github.com/scireum/SCICoreTools', :tag => "#{s.version}" }
s.source_files = 'SCICoreTools/**/*.{swift}'
s.resources    = 'SCICoreTools/**/*.{png,jpeg,jpg,storyboard,xib,xcassets,pdf}'
s.platform     = :ios, '10.0'
end