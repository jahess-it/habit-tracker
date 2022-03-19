<template>
  <div>
    <Navbar location="createjournal"></Navbar>
    <JournalCreator></JournalCreator>
  </div>
</template>

<script>
import Api from "../api";
import { } from '../auth';
import JournalCreator from "../components/JournalCreator.vue";
import Navbar from "../components/Navbar.vue";
import { getJwtToken } from "../auth";
import { getUserIdFromToken } from "../auth";
export default {
  components: { JournalCreator, Navbar }
};
</script>
