function updateHealthBar(playerHealth, playerArmor, playerHunger, playerThirst) {
    const healthBar = document.getElementById("healthFill");
    const armorBar = document.getElementById("armorFill");
    const hungerBar = document.getElementById("hungerFill");
    const thirstBar = document.getElementById("thirstFill");


    // Calculate the fill percentage based on currentHealth and playerMaxHealth

    // Set width of health bar to the fill percentage
    healthBar.style.height = playerHealth + "%";
    armorBar.style.height = playerArmor + "%";
    hungerBar.style.height = playerHunger +"%";
    thirstBar.style.height = playerThirst +"%";
}

window.addEventListener("message", function (event) {
    if (event.data.type === 'playerHealth') {
        updateHealthBar(event.data.playerHealth, event.data.playerArmor, event.data.playerHunger, event.data.playerThirst);
    }
});
