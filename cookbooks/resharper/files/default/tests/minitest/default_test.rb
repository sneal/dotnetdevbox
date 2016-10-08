require 'minitest/spec'

# resharper test class
class TestResharperInstall < MiniTest::Chef::TestCase
  def test_resharper_was_installed
    assert Dir.exist?(node['resharper']['install_dir'])
  end
end
