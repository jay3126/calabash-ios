module Calabash
  module RspecIntegrationTests
    module UIA
      class TestObject
        include Calabash::Cucumber::KeyboardHelpers
        include Calabash::Cucumber::WaitHelpers
      end
    end
  end
end

describe Calabash::Cucumber::UIA do

  describe 'targeting simulators' do
    let(:launcher) { Calabash::Cucumber::Launcher.new }
    let(:test_object) { Calabash::RspecIntegrationTests::UIA::TestObject.new }
    let(:options) {
      options =
            {
                  :app => Resources.shared.app_bundle_path(:lp_simple_example),
                  :device_target =>  'simulator',
                  :sim_control => RunLoop::SimControl.new,
                  :launch_retries => Resources.shared.launch_retries
            }
    }

    it "Xcode #{Resources.shared.current_xcode_version} strategy :preferences" do
      options[:uia_strategy] = :preferences
      launcher.relaunch(options)
      expect(launcher.run_loop).not_to be == nil
      test_object.wait_tap('textField')
      test_object.wait_for_keyboard
    end

    it "Xcode #{Resources.shared.current_xcode_version} strategy :shared_element" do
      options[:uia_strategy] = :shared_element
      launcher.relaunch(options)
      expect(launcher.run_loop).not_to be == nil
      test_object.wait_tap('textField')
      test_object.wait_for_keyboard
    end

    it "Xcode #{Resources.shared.current_xcode_version} strategy :host" do
      options[:uia_strategy] = :host
      launcher.relaunch(options)
      expect(launcher.run_loop).not_to be == nil
      test_object.wait_tap('textField')
      test_object.wait_for_keyboard
    end
  end
end