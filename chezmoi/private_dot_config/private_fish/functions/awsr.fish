function awsr --description 'Select an AWS region with fzf and export AWS_REGION'
    set -l regions \
        "us-east-1|US East (N. Virginia)" \
        "us-east-2|US East (Ohio)" \
        "us-west-1|US West (N. California)" \
        "us-west-2|US West (Oregon)" \
        "af-south-1|Africa (Cape Town)" \
        "ap-east-1|Asia Pacific (Hong Kong)" \
        "ap-south-1|Asia Pacific (Mumbai)" \
        "ap-south-2|Asia Pacific (Hyderabad)" \
        "ap-northeast-1|Asia Pacific (Tokyo)" \
        "ap-northeast-2|Asia Pacific (Seoul)" \
        "ap-northeast-3|Asia Pacific (Osaka)" \
        "ap-southeast-1|Asia Pacific (Singapore)" \
        "ap-southeast-2|Asia Pacific (Sydney)" \
        "ap-southeast-3|Asia Pacific (Jakarta)" \
        "ap-southeast-4|Asia Pacific (Melbourne)" \
        "ap-southeast-5|Asia Pacific (Malaysia)" \
        "ap-southeast-7|Asia Pacific (Thailand)" \
        "ca-central-1|Canada (Central)" \
        "ca-west-1|Canada West (Calgary)" \
        "eu-central-1|Europe (Frankfurt)" \
        "eu-central-2|Europe (Zurich)" \
        "eu-west-1|Europe (Ireland)" \
        "eu-west-2|Europe (London)" \
        "eu-west-3|Europe (Paris)" \
        "eu-north-1|Europe (Stockholm)" \
        "eu-south-1|Europe (Milan)" \
        "eu-south-2|Europe (Spain)" \
        "il-central-1|Israel (Tel Aviv)" \
        "mx-central-1|Mexico (Central)" \
        "me-south-1|Middle East (Bahrain)" \
        "me-central-1|Middle East (UAE)" \
        "sa-east-1|South America (Sao Paulo)"

    set -l selection (printf '%s\n' $regions | column -t -s '|' | fzf --prompt='AWS region> ' --height=40% --reverse)

    if test -z "$selection"
        set -e AWS_REGION
        echo "awsr: no region selected, AWS_REGION unset" >&2
        return 1
    end

    set -l region (string split -f1 ' ' -- $selection)

    set -gx AWS_REGION $region
    echo "AWS_REGION set to $region"
end
