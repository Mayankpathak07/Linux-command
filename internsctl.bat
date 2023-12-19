#!/bin/bash

# internsctl - Custom Linux command for internship operations
# Version: v0.1.0

# Function to display command usage
display_usage() {
    echo "Usage: internsctl [options]"
    echo "Options:"
    echo "  --help                      Display usage guidelines and examples"
    echo "  --version                   Display the version of internsctl"
    echo "  cpu getinfo                 Get CPU information (similar to lscpu)"
    echo "  memory getinfo              Get memory information (similar to free)"
    echo "  user create <username>      Create a new user with login access and home directory"
    echo "  user list                   List all regular users"
    echo "  user list --sudo-only       List users with sudo permissions"
    echo "  file getinfo <file-name>    Get information about a file"
    echo "  file getinfo [options]      Get specific information about a file"
    echo "    --size, -s                Print file size"
    echo "    --permissions, -p         Print file permissions"
    echo "    --owner, -o               Print file owner"
    echo "    --last-modified, -m       Print last modification time"
}

# Function to display script version
display_version() {
    echo "internsctl version v0.1.0"
}

# Handle command-line options
case "$1" in
    --help)
        display_usage
        ;;
    --version)
        display_version
        ;;
    cpu)
        case "$2" in
            getinfo)
                get_cpu_info
                ;;
            *)
                echo "Error: Unknown CPU sub-command. Use 'internsctl cpu getinfo' for CPU information."
                exit 1
                ;;
        esac
        ;;
    memory)
        case "$2" in
            getinfo)
                get_memory_info
                ;;
            *)
                echo "Error: Unknown memory sub-command. Use 'internsctl memory getinfo' for memory information."
                exit 1
                ;;
        esac
        ;;
    user)
        case "$2" in
            create)
                create_user "$@"
                ;;
            list)
                list_users
                ;;
            *)
                echo "Error: Unknown user sub-command. Use 'internsctl user create <username>' or 'internsctl user list'."
                exit 1
                ;;
        esac
        ;;
    file)
        case "$2" in
            getinfo)
                shift 2
                get_file_info "$@"
                ;;
            *)
                echo "Error: Unknown file sub-command. Use 'internsctl file getinfo <file-name>' for file information."
                exit 1
                ;;
        esac
        ;;
    *)
        echo "Error: Unknown option. Use 'internsctl --help' for usage information."
        exit 1
        ;;
esac

exit 0
