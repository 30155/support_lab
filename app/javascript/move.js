function move () {
  const inputs = document.querySelectorAll('.user_info')

  for (let i = 0, len = inputs.length; i < len; i++) {
    const input = inputs.item(i)

    input.addEventListener('click', (e)=>{
      const target = e.target
      const id = target.id
      const label = document.querySelector(`label[for="${id}"]`)
      label.classList.add('move')
    })

    input.addEventListener('blur', (e)=>{
      const target = e.target
      const id = target.id
      const label = document.querySelector(`label[for="${id}"]`)
      if (target.value.length === 0) {
        label.classList.remove('move')
      }
    })

    const id = input.id
    const label = document.querySelector(`label[for="${id}"]`)
    if (input.value.length !== 0) {
      label.classList.add('move')
    }
  }
}

window.addEventListener('load', move)