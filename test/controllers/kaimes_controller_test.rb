require 'test_helper'

class KaimesControllerTest < ActionDispatch::IntegrationTest

    def setup
        @micropost = microposts(:one)    
    end

    test '買い目登録のテスト' do
        assert_difference '@micropost.kaimes.count', 1 do
            post kaimes_path, params: {micropost_id: @micropost.id,
                                baken_type: "単勝",
                                buy_type: "",
                                kaime: {
                                    first_hoses: "1"
                                }
                            }
        end
    end

    test '買い目登録のテスト Ajax' do
        assert_difference '@micropost.kaimes.count', 1 do
            post kaimes_path, xhr: true,  
                                params: {micropost_id: @micropost.id,
                                    baken_type: "単勝",
                                    buy_type: "",
                                    kaime: {
                                        first_hoses: "1"
                                    }
                                }
        end
    end

    test '買い目削除のテスト' do
        @kaime = kaimes(:one)
        @micropost.kaimes << @kaime
        @micropost.reload
        assert_difference '@micropost.kaimes.count', -1 do
            delete kaime_path(@kaime, micropost_id:@micropost.id)
        end
    end

    test '買い目削除のテスト Ajax' do
        @kaime = kaimes(:one)
        @micropost.kaimes << @kaime
        @micropost.reload
        assert_difference '@micropost.kaimes.count', -1 do
            delete kaime_path(@kaime, micropost_id:@micropost.id), xhr: true
        end
    end

end
