require 'spec_helper'

describe 'uc_site1' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "uc_site1 class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('uc_site1::params') }
          it { is_expected.to contain_class('uc_site1::install').that_comes_before('uc_site1::config') }
          it { is_expected.to contain_class('uc_site1::config') }
          it { is_expected.to contain_class('uc_site1::service').that_subscribes_to('uc_site1::config') }

          it { is_expected.to contain_service('uc_site1') }
          it { is_expected.to contain_package('uc_site1').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'uc_site1 class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
          :osfamily        => 'Solaris',
          :operatingsystem => 'Nexenta',
        }
      end

      it { expect { is_expected.to contain_package('uc_site1') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
