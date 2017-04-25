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
   s.requires_arc = true

   s.dependency "Toast","~> 3.1.0"
   s.dependency "SDWebImage","~> 3.8"
   s.dependency "MBProgressHUD","~> 1.0.0"
   s.dependency "AFNetworking","~> 2.0"
   s.dependency "Masonry"
end
