Pod::Spec.new do |s|
   s.name         = "Murphy-Common"
   s.version      = "0.0.1"
   s.summary      = "A iOS Tools."
   s.homepage     = "https://github.com/jeasonyoung/Murphy-Common-iOS"
   s.license      = "MIT"
   s.author       = { "yangyong"=>"jeason1914@qq.com" }
   s.source       = { :git => "https://github.com/jeasonyoung/Murphy-Common-iOS.git", :tag => "#{s.version}" }
   s.platform     = :ios
   s.source_files = "Murphy-Common/Murphy-Common"
   s.frameworks   = "AFNetworking","MBProgressHUD","SDWebImage","Toast" 
   s.requires_arc = true
end
