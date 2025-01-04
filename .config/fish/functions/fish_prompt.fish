function fish_prompt
    string join '' -- (set_color --bold blue) $USER (set_color --bold normal)' '(prompt_pwd)\n'... $ '(set_color normal)
end
