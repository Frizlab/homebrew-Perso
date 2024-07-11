cask 'base64' do
  version '1.0.4'
  sha256 'c0be3596333c76a8bf1f4b8f6d210e40edf593783ee82844be81a4d4620f7c34'

  url "https://github.com/Frizlab/Base-64/releases/download/Base64-v#{version}/Base64.zip"
  name 'Base64'
  homepage 'https://github.com/Frizlab/Base-64'

  app 'Base 64.app'

  zap trash: [
               '~/Library/Containers/me.frizlab.base64',
             ]
end
