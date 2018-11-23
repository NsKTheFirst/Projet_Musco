<template>
    <div>
        <figure>
            <img src="@/assets/Images/photo_header.jpg" alt="Studio">
        </figure>
        <About/>
        <News></News>
    </div>
</template>

<script>
import About from '@/components/About.vue'
import News from '@/components/News.vue'
export default {
    components: {
        About,
        News,
    }
}
</script>

<style lang='scss'>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box
    }

    img {
        width: 100%;
        margin-top: 70px
    }
</style>
