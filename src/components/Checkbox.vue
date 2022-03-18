<template>
  <label :for="name" class="checkbox">
    <input
      type="checkbox"
      :id="name"
      @change="updateChecked"
      :checked="value"
    />
    {{ text }}
  </label>
</template>

<script>
export default {
  props: ["value", "text", "name"],
  methods: {
    updateChecked(event) {
      this.$emit("input", event.target.checked); // emit the checkbox value
    }
  }
};
</script>

<style>
.checkbox {
  display: flex;
  align-items: center; /* supported in IE 11 */
}
.checkbox input {
  -webkit-appearance: none; /* hide the default checkbox */
  background-color: #fff; /* checkbox default background */
  border: 1px solid #ccc;
  padding: 8px;
  margin-right: 10px;
  display: inline-block;
  position: relative;
}
.checkbox input:after {
  content: "";
  display: none;
  position: absolute;
  left: 5px; /* checkmark positioning */
  top: 1px; /* checkmark positioning */
  width: 4px; /* checkmark size */
  height: 10px; /* checkmark size */
  border: solid #ccc; /* checkmark color */
  border-width: 0 2px 2px 0; /* checkmark stroke width */
  -webkit-transform: rotate(45deg);
  -ms-transform: rotate(45deg);
  transform: rotate(45deg);
}
.checkbox input:focus {
  outline: none; /* removing the focus outline is not advisable */
  /* but if you need to set custom focused state, your code goes here */
}
.checkbox input:hover {
  background-color: #e9ecee; /* checkbox hover background */
}
.checkbox input:checked:after {
  display: block;
}
</style>