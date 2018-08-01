<template lang="pug">
  svg(version="1.1" baseProfile="full" xmlns="http://www.w3.org/2000/svg"
    width="400" height="300"
    viewbox="0 0 400 300"
  )
    - var drow= []
    - drow.push("M 10 315")
    - drow.push("L 110 215")
    - drow.push("A 30 50 0 0 1 162.55 162.45")
    - drow=drow.join(" ")
    path(
      d=drow
      stroke="black" fill="green" stroke-width="2"

    )
</template>
