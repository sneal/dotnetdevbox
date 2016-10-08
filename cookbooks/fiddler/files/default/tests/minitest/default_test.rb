require 'minitest/spec'

# fiddler test class
class FiddlerInstallTest < MiniTest::Chef::TestCase
  def test_fiddler_exe_exists
    assert File.exist?(::File.join(node['fiddler']['install_dir'], 'Fiddler.exe'))
  end
end
