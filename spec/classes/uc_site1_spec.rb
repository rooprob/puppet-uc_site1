require 'spec_helper'

describe 'uc_site1' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts.merge({
          concat_basedir: '/dne',
        })
      end
      context "uc_site1 class without any parameters" do
        it { is_expected.to compile.with_all_deps }

        it { is_expected.to contain_class('uc_site1::frontend') }
        it { is_expected.to contain_class('uc_site1::database') }
        it { is_expected.to contain_class('uc_site1::maintenance') }
      end
    end
  end
end
