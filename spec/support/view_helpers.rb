module ViewHelpers

  def stub_article(&block)
    controller.singleton_class.class_exec(block) do
      helper_method :article
      define_method :article do
        block.call
      end
    end
  end

  def stub_articles_list(&block)
    controller.singleton_class.class_exec(block) do
      helper_method :articles
      define_method :articles do
        block.call
      end
    end
  end

end