# A Tool for Easy and Fast Powerlevel10k, Kitty, Neovim (NvChad) Installation - pokine.sh

<hr>

<div>
	<p align=justify>This tool is designed to save you time every time you need to set up a Debian distribution, whether it's on a virtual machine or a physical installation, and you desire both aesthetics and productivity enhancements. With just a few simple steps, you'll have everything configured and ready to use.</p>
</div>

<img src='https://github.com/LuisRamos98/pokine.sh/blob/main/Adjuntos/1_Final_Setup.png?raw=true' align=center>

## PRE-Requisites

<hr>

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

<hr>

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

<img src='https://github.com/LuisRamos98/pokine.sh/blob/main/Adjuntos/2_Oh-my-zsh.png?raw=true' align=center>

- Write `exit` then press \<Enter\> to continue with the instalation.

<img src='https://github.com/LuisRamos98/pokine.sh/blob/main/Adjuntos/3_exit_zsh.png?raw=true' align=center>

Now the script is finish.

<img src='https://github.com/LuisRamos98/pokine.sh/blob/main/Adjuntos/4_script_finished.png?raw=true' align=center>

## Post-Instalation

<hr>

- Open kitty 

<img src='https://github.com/LuisRamos98/pokine.sh/blob/main/Adjuntos/5_open_kitty.png?raw=true' align=center>

The last thing you have to do is open neovim in both user and as a root.

```bash
nvim
```

<img src='https://github.com/LuisRamos98/pokine.sh/blob/main/Adjuntos/6_nvim_root_user.png?raw=true' align=center>

Then NvChad will autoconfigure and you have to wait until you see this.

<img src='https://github.com/LuisRamos98/pokine.sh/blob/main/Adjuntos/7_setting_nvim.png?raw=true' align=center>

Then press q and finally you have to close both neovim.

