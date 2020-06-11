cask 'my-web-quirks' do
  version '1.1'
  sha256 '4adf07434bf828bf53e242f5d7a93674dd5d0213bc95c743c5301fc1e41eb94a'

  url 'https://gitlab.com/Frizlab/My-Web-Quirks/uploads/60dc715cfb4709ca9e7555684a96f7ea/My_Web_Quirks.zip'
  name 'My Web Quirks'
  homepage 'https://gitlab.com/Frizlab/My-Web-Quirks'

  app 'My Web Quirks.app'

  zap trash: [
	  '~/Library/Containers/me.frizlab.No-GitHub-Hover-Safari-Extension',
	  '~/Library/Containers/me.frizlab.No-GitHub-Hover-Safari-Extension.No-GitHub-Hover'
  ]
end
