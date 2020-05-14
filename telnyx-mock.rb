# This file was generated by GoReleaser. DO NOT EDIT.
class TelnyxMock < Formula
  desc "telnyx-mock is a mock HTTP server that responds like the real Telnyx API. It can be used instead of Telnyx's testmode to make test suites integrating with Telnyx faster and less brittle."
  homepage "https://github.com/team-telnyx/telnyx-mock"
  version "0.8.10"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/team-telnyx/telnyx-mock/releases/download/v0.8.10/telnyx-mock_0.8.10_darwin_amd64.tar.gz"
    sha256 "af3eea3a285a646d2f2cda61bbeb9f07f9242851e410fc84b7bdedf183d06737"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/team-telnyx/telnyx-mock/releases/download/v0.8.10/telnyx-mock_0.8.10_linux_amd64.tar.gz"
      sha256 "b858d8fe1c8c4fd1cc51bbe9da8405f44a59385f9eede32c80fe34081d20b369"
    end
  end

  def install
    bin.install "telnyx-mock"
  end

  plist_options :startup => false

  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>KeepAlive</key>
    <dict>
      <key>SuccessfulExit</key>
      <false/>
    </dict>
    <key>Label</key>
    <string>#{plist_name}</string>
    <key>ProgramArguments</key>
    <array>
      <string>#{opt_bin}/telnyx-mock</string>
      <string>-http-port</string>
      <string>12111</string>
      <string>-https-port</string>
      <string>12112</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>WorkingDirectory</key>
    <string>#{var}</string>
    <key>StandardErrorPath</key>
    <string>#{var}/log/telnyx-mock.log</string>
    <key>StandardOutPath</key>
    <string>#{var}/log/telnyx-mock.log</string>
  </dict>
</plist>

  EOS
  end
end
