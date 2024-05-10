# A Tool for Easy and Fast Powerlevel10k, Kitty, Neovim (NvChad) Installation - pokine.sh

<hr>

<div>
	<p align=justify>This tool is designed to save you time every time you need to set up a Debian distribution, whether it's on a virtual machine or a physical installation, and you desire both aesthetics and productivity enhancements. With just a few simple steps, you'll have everything configured and ready to use.</p>
</div>

![[Pasted image 20240510081429.png]]
## PRE-Requisites

It´s important to know this tool only work on Debian Distros like Ubuntu, Kali, and Parrot.

<table align=center>	
	<thead>
		<tr>
			<th>Distribution</th>
			<th>Version</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>Ubuntu</td>
			<td>23.10 (Mantic Minotaur) and later</td>
		</tr>
		<tr>
			<td>Kali Linux</td>
			<td>2024.1 (Micro Mirror) and later</td>
		</tr>
		<tr>
			<td>Parrot OS</td>
			<td>5.3 and later</td>
		</tr>
	</tbody>
</table>

## Installation 

First, you need to clone this repo.

```bash
git clone https://github.com/LuisRamos98/pokine.sh.git
```

Give pokine.sh execution permision

```bash
cd pokine.sh
```

```bash
chmod +x pokine.sh
```

Then, execute.

```bash
./pokine.sh
```

**Note:** When it is installing oh-my-zsh, you have to do the following steps.

- Press \<Enter\> 

![[Pasted image 20240510082021.png]]

- Write `exit` then press \<Enter\> to continue with the instalation.

![[Pasted image 20240510082333.png]]

Now the script is finish.

![[Pasted image 20240510082523.png]]

## Post-Instalation

- Open kitty 

![[Pasted image 20240510082919.png]]

The last thing you have to do is open neovim in both user and as a root.

```bash
nvim
```

![[Pasted image 20240510083027.png]]

Then this will be autoconfigure, you have to wait until you see this.

![[Pasted image 20240510082832.png]]

Then press q and finally you have to close both neovim.

