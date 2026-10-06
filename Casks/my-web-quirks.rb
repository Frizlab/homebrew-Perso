cask 'my-web-quirks' do
  version '1.3.0'
  sha256 'ce621bcf985ba67ba779bcdbe85ba1ed28bceb3cd26fde533ee02cfb66871c68'

  url 'https://gitlab.com/-/project/7641123/uploads/4e7180a401ea15b0a2585fdd27847309/My_Web_Quirks.zip'
  name 'My Web Quirks'
  homepage 'https://gitlab.com/Frizlab/My-Web-Quirks'

  app 'My Web Quirks.app'

  zap trash: [
	  '~/Library/Containers/me.frizlab.No-GitHub-Hover-Safari-Extension',
	  '~/Library/Containers/me.frizlab.No-GitHub-Hover-Safari-Extension.No-GitHub-Hover'
  ]
end
