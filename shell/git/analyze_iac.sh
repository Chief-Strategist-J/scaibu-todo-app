analyze_iac() {
    echo "=== Infrastructure as Code Analysis ==="

    # Analyze Terraform configurations
    echo "Terraform Configuration Analysis:"
    find . -type f -name "*.tf" | while read -r tf_file; do
        echo "Analyzing $tf_file:"
        # Check resource definitions
        echo "  Resources:"
        grep -E "^resource" "$tf_file" | sed 's/^/    /'
        # Check variable definitions
        echo "  Variables:"
        grep -E "^variable" "$tf_file" | sed 's/^/    /'
    done

    # Analyze Kubernetes manifests
    echo -e "\nKubernetes Manifest Analysis:"
    find . -type f -name "*.yaml" -o -name "*.yml" | while read -r k8s_file; do
        if grep -q "apiVersion:" "$k8s_file"; then
            echo "Analyzing $k8s_file:"
            # Extract resource types
            echo "  Resource types:"
            grep -E "kind:|apiVersion:" "$k8s_file" | sed 's/^/    /'
        fi
    done

    # Analyze Docker configurations
    echo -e "\nDocker Configuration Analysis:"
    find . -type f -name "Dockerfile*" -o -name "docker-compose*.yml" |
        while read -r docker_file; do
            echo "Analyzing $docker_file:"
            case "$docker_file" in
                Dockerfile*)
                    echo "  Base images:"
                    grep "^FROM" "$docker_file" | sed 's/^/    /'
                    echo "  Exposed ports:"
                    grep "^EXPOSE" "$docker_file" | sed 's/^/    /'
                    ;;
                docker-compose*)
                    echo "  Services:"
                    grep -E "^  [a-zA-Z0-9_-]+:" "$docker_file" | sed 's/^/    /'
                    ;;
            esac
    done
}