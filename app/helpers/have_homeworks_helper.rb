module HaveHomeworksHelper

  def score_label(work)
    label_class="label "
    if work.score==4
    label_class+="label-primary"
    elsif work.score==3
    label_class+="label-success"
    elsif work.score==2
    label_class+="label-info"
    else
    label_class+="label-warning"
    end
    content_tag(:span,work.score_text,class:label_class)
  end
end
