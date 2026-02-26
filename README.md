🔬 Project Overview

NetTool.bat is a minimalist Batch-based Orchestrator designed to demonstrate multi-stage payload delivery through a "Masqueraded Utility" interface.

The script simulates a legitimate network diagnostic tool (ping, tracert, ipconfig) while simultaneously managing the lifecycle and execution of secondary "Dependency"

binaries in the background.

🛠️ Technical Architecture

Host Utility: NetTool.bat (The Masquerade)

Stage-1 Delivery: Embedded logic to identify and call sub-processes.

Dependency Management: Modular execution of external payloads located in the /deps/ or temp directory.

Execution Flow: Sequential or Asynchronous process spawning via start /b.

📂 Directory Structure

Plaintext

/NetTool/

├── NetTool.bat       <-- Fake Tool that runs silent runner.vbs and Main.bat

├── /dependencies/    <-- Payload Repository (PoC)

🗄️Hidden Files

Silent runner.vbs     <-- Makes Main.bat Run In The Background

Main.bat              <-- The Batch Script That Runs All the "dependencies"

🛡️ Analysis Goals

Process Tree Obfuscation: Studying how parent-child process relationships appear in EDR (Endpoint Detection and Response) logs.

Social Engineering Simulation: Testing user interaction rates when a "utility" requires "dependency updates."

LotL (Living off the Land): Utilizing native Windows binaries to facilitate execution.
