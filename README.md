# GTFOBins-Explorer
Terminal explorer in GTFOBins web.

Tool developed by: **creep33**.

## Requisites: 
Requirements: html2text

[!] NOTE: Install it with pip2 (python2)

```bash
python2 -m pip install html2text
```

## Installation:
Use the ng version for arch, and the normal to the rest of distros.

### Using AUR:
```
paru -S gtfobins-explorer-git
```
### Manual:
```
git clone https://github.com/creep33/GTFOBins-Explorer
cd GTFOBins-Explorer 
mv GTFOBins-Explorer /usr/bin/gtfobins

```


## Usage: 
```bash 
Usage: gtfobins [-f <path_to_file>] [<binary>]
When matchen binary: gtfobins <binary> <option>
```

You can use the "-f" flag to input a list generated with the following command:

```bash
find \-perm -4000 2>/dev/null > /tmp/filename
```
