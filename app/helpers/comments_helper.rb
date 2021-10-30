module CommentsHelper
  def post_title(post_type)
    case post_type
    when 'post'
      '投稿する'
    when 'edit'
      '編集する'
    end
  end

  def submit_btn(post_type)
    case post_type
    when 'post'
      '投稿'
    when 'edit'
      '更新'
    end
  end
end
