cask 'my-web-quirks' do
  version '1.2.1'
  sha256 '9205f52a39151c0c13f03fbdaadf64a1b7198d8c0a9728c59fbb641a7b7066f0'

  url 'https://gitlab.com/Frizlab/My-Web-Quirks/uploads/6dfd593560fdbe7d59b14c420e9e7612/My_Web_Quirks.zip'
  name 'My Web Quirks'
  homepage 'https://gitlab.com/Frizlab/My-Web-Quirks'

  app 'My Web Quirks.app'

  zap trash: [
	  '~/Library/Containers/me.frizlab.No-GitHub-Hover-Safari-Extension',
	  '~/Library/Containers/me.frizlab.No-GitHub-Hover-Safari-Extension.No-GitHub-Hover'
  ]
end
