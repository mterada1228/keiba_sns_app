require 'test_helper'

class UserTest < ActiveSupport::TestCase

  # 有効なUserをテスト実行の前に作成
  def setup
    @user = User.new(name: "Example User", email: "user@example.com", 
                      password: "foobar", password_confirmation: "foobar")
  end
  
  # setupで作成したUserが有効かどうかチェック 
  test "should be valid" do
    assert @user.valid?
  end
  
  # nameの存在性チェックのテスト
  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end
  
  # nameの存在性チェックのテスト
  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end
  
  # nameの長さのテスト
  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  # emailの長さのテスト
  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end
  
  # 有効なemailのテスト
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  # 無効なemailのテスト
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com foo@bar..com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  
  # emailの一意性のテスト
  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase # 大文字・小文字を区別しない
    @user.save
    assert_not duplicate_user.valid?
  end
  
  # callbackのテスト(emailのdawncase)
  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end
  
  # パスワードの存在性チェックのテスト
  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  # パスワードの最小文字チェックのテスト
  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
  
  test "should follow and unfollow a user" do
    michael = users(:michael)
    other  = users(:other)
    assert_not michael.following?(other)
    michael.follow(other)
    assert michael.following?(other)
    assert other.followers.include?(michael)
    michael.unfollow(other)
    assert_not michael.following?(other)
  end

end
