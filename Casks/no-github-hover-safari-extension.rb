cask 'no-github-hover-safari-extension' do
  version '1.0'
  sha256 '409697cd506086fd4ce5987fc8a79aa9f76c5b7808cf0ee89e9d18dccde8acc0'

  url 'https://gitlab.com/Frizlab/No-GitHub-Hover/uploads/e62f1e5df572c8f7501ac94f75114444/No_GitHub_Hover_Safari_Extension.zip'
  name 'No GitHub Hover Safari Extension'
  homepage 'https://gitlab.com/Frizlab/No-GitHub-Hover'

  app 'No GitHub Hover Safari Extension.app'

  zap trash: []
end
