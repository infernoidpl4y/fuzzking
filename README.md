# fuzzking

**A fast and flexible web brute-forcing and fuzzing tool, written in Nim.**

## 📋 Description

fuzzking is a web fuzzer built for pentesters and bug bounty hunters who need to discover paths, directories, subdomains, parameters, and virtual hosts quickly.

## 🚀 Installation

### Option 1: Download the prebuilt binary (recommended)

Grab the latest binary for your platform from the [Releases](https://github.com/infernoidpl4y/fuzzking/releases) page:

```bash
wget https://github.com/infernoidpl4y/fuzzking/releases/latest/download/fuzzking
chmod +x fuzzking
sudo mv fuzzking /usr/local/bin/fuzzking
```
### Option 2: Build from source

```bash
# Clone the repository
git clone https://github.com/infernoidpl4y/fuzzking.git
cd fuzzking

# Build / install
nim c -d:ssl fuzzking.nim
```

## 💻 Basic Usage

```bash
# Directory discovery
fuzzking -a https://target.com/FZZK -w wordlist.txt

# Parameter fuzzing
fuzzking -a https://target.com/api?FZZK=test -w params.txt

# Subdomain enumeration
fuzzking -a https://FZZK.target.com -w subdomains.txt
```

**⭐ If you find it useful, consider giving the repository a star**
