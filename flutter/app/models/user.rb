class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         has_many :posts, dependent: :destroy
         has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
         has_many :passive_relationships, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy

         has_many :followingg, through: :active_relationships, source: :following
         has_many :followers, through: :passive_relationships, source: :follower

         def follow(other)
           active_relationships.create(following_id: other.id)
         end

         def unfollow(other)
           active_relationships.find_by(following_id: other.id).destroy
         end

         def followingg?(other)
           followingg.include?(other)
         end


end
