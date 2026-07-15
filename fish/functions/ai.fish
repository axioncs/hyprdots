function ai --description "One-shot query to Aria"
    if test (count $argv) -eq 0
        echo "Usage: ai <prompt> or <cmd> | ai"
        return 1
    end

    set -l persona (cat ~/.config/ai-assistant/system_prompt.txt)
    set -l prompt (string join " " $argv)

    if not test -t 0
        set -l stdin (cat)
        set prompt "$stdin\n\n$prompt"
    end

    hermes -z "$persona\n\n$prompt"
end
