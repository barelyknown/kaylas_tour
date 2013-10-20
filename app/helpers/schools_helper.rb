module SchoolsHelper

  def school_open_to_general_public(school)
    return "The school is open to the general public." if school.open_to_the_general_public?
    return "The school is not open to the general public." if !school.open_to_the_general_public?
  end

  def school_all_remote(school)
    return "The school does provide all remote options." if school.all_remote?
    return "The school does not provide all remote options." if !school.all_remote?
  end

end
