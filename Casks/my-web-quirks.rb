cask 'my-web-quirks' do
  version '1.2'
  sha256 'ff6a73d99e1f5e4d97a6f46e1cdaa4efd4c4d4d5c53b82c2a6efcf2b4e3e8b46'

  url 'https://gitlab.com/Frizlab/My-Web-Quirks/uploads/83a454dc0407faab11f0ff96f733614a/My_Web_Quirks.zip'
  name 'My Web Quirks'
  homepage 'https://gitlab.com/Frizlab/My-Web-Quirks'

  app 'My Web Quirks.app'

  zap trash: [
	  '~/Library/Containers/me.frizlab.No-GitHub-Hover-Safari-Extension',
	  '~/Library/Containers/me.frizlab.No-GitHub-Hover-Safari-Extension.No-GitHub-Hover'
  ]
end
