# 📁 Databricks-to-GoogleDrive File Bridge (macOS)

This guide shows you how to copy files from **Databricks DBFS** to your **Google Drive** using a Bash script on macOS. You'll use:

* [`databricks-cli`](https://docs.databricks.com/dev-tools/cli/index.html) – to download files from DBFS
* [`rclone`](https://rclone.org/drive/) – to upload files to Google Drive
* A Bash script (`file_bridge.sh`) – to automate the process

---

## 🧰 1. Install Required Tools

### 🔹 Install Databricks CLI

```bash
brew install databricks-cli
```

Then authenticate:

```bash
databricks configure --token
```

* **Databricks Host**: `886789292378781.1.gcp.databricks.com`
* **Token**: get token from databricks_workspace -> setting -> devloper -> access token

---

### 🔹 Install `rclone`

```bash
brew install rclone
```

---

## 🔐 2. Configure Rclone (one-time setup)

```bash
rclone config
```

Steps:

1. Press `n` to create a new remote
2. Name it: `gdrive`
3. Choose storage: `drive`
4. Press `Enter` to use default client ID and secret
5. Choose `scope`: `1` (Full access to Drive)
6. Leave everything else default
7. It will open a browser → login to your Google account and grant access

✅ This will save a working `rclone.conf` under `~/.config/rclone/rclone.conf`.

---

## 📜 3. Make Bash Script it executable:

```bash
chmod +x file_bridge.sh
```

---

## 🚀 4. Run the Script

Here’s an example of how to use it:

```bash
./file_bridge.sh \
  dbfs:{DBFS filestore path in databricks} \
  {local store path} \
  {name of rclone config} \
  {googledrive path}
```
